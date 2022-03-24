( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b550 - block
    b290 - block
    b366 - block
    b233 - block
    b879 - block
    b110 - block
    b448 - block
    b410 - block
    b775 - block
    b37 - block
    b993 - block
    b799 - block
    b685 - block
    b237 - block
    b269 - block
    b538 - block
    b614 - block
    b502 - block
    b653 - block
    b51 - block
    b436 - block
    b296 - block
    b375 - block
    b902 - block
    b261 - block
    b319 - block
    b132 - block
    b392 - block
    b725 - block
    b832 - block
    b208 - block
    b671 - block
    b726 - block
    b304 - block
    b700 - block
    b60 - block
    b964 - block
    b905 - block
    b827 - block
    b645 - block
    b974 - block
    b804 - block
    b922 - block
    b338 - block
    b395 - block
    b883 - block
    b170 - block
    b808 - block
    b162 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b550 )
    ( on b290 b550 )
    ( on b366 b290 )
    ( on b233 b366 )
    ( on b879 b233 )
    ( on b110 b879 )
    ( on b448 b110 )
    ( on b410 b448 )
    ( on b775 b410 )
    ( on b37 b775 )
    ( on b993 b37 )
    ( on b799 b993 )
    ( on b685 b799 )
    ( on b237 b685 )
    ( on b269 b237 )
    ( on b538 b269 )
    ( on b614 b538 )
    ( on b502 b614 )
    ( on b653 b502 )
    ( on b51 b653 )
    ( on b436 b51 )
    ( on b296 b436 )
    ( on b375 b296 )
    ( on b902 b375 )
    ( on b261 b902 )
    ( on b319 b261 )
    ( on b132 b319 )
    ( on b392 b132 )
    ( on b725 b392 )
    ( on b832 b725 )
    ( on b208 b832 )
    ( on b671 b208 )
    ( on b726 b671 )
    ( on b304 b726 )
    ( on b700 b304 )
    ( on b60 b700 )
    ( on b964 b60 )
    ( on b905 b964 )
    ( on b827 b905 )
    ( on b645 b827 )
    ( on b974 b645 )
    ( on b804 b974 )
    ( on b922 b804 )
    ( on b338 b922 )
    ( on b395 b338 )
    ( on b883 b395 )
    ( on b170 b883 )
    ( on b808 b170 )
    ( on b162 b808 )
    ( clear b162 )
  )
  ( :goal
    ( and
      ( clear b550 )
    )
  )
)
