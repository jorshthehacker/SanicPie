use_bpm 120
use_random_seed 314159265358979323846
/Yes, that *is* the first 20 digits of pi as a random seed. It gives repeatability to each run.
Comment out that line if you want "real" randomness. And yes, you can put comments between JUST a pair of forward slashes./
use_random_seed Time.now.to_i + rrand_i(-1000000000100000000000000000000000000, 1000000000010000000000000000000000000)
#You could totally change those huge numbers to random numbers all their own, as I did in the live loop below.

live_loop :ambient do
  use_octave -0.5
  t += rrand_i()
 use_random_seed t
  puts "Seed: #{t}"
  z = [66,68,70,72,74,76,78,80,82,84].choose #change the arguments for this one, too. It will change things everywhere.
  n = ((chord :c, :m7) + [z]).sort #change the arguments for this, see what you get!
  v = (line 0.55, 1).reflect
  p = (line -0.85, 0.85, steps: 150).reflect
  s1 = synth :prophet, note: n.tick(:n), attack: [0,0,0,0,2].choose, release: [0.5,0.5,0.5,2].choose, amp: v.tick, pan: p.look, cutoff: rrand(90, 120)
  s2 = synth :dark_ambience, note: n.tick(:n), attack: [0, 0.125, 0.25, 0.5, 0.625, 0.75, 0.825, 1].choose, release: [0.5,0.5,0.5,2].choose, amp: 1, pan: p.look, cutoff: 128, noise: [0,1,2,3,4].choose, ring: [rrand(0.1, 50), rrand(0.1, 50), rrand(0.1, 50)].choose
  control s1, amp: v.tick, amp_slide: [0.0625, 0.25].choose, pan: p.look, pan_slide: 0.25, depth: 2, depth_slide: 1.5
  control s2, amp: v.tick, amp_slide: [0.0625, 0.25].choose, pan: p.look, pan_slide: 0.25, depth: 2, depth_slide: 1.5
  sleep 0.25
end
