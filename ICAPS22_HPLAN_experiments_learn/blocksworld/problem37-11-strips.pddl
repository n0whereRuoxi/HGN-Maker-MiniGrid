( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b918 - block
    b518 - block
    b972 - block
    b620 - block
    b204 - block
    b201 - block
    b777 - block
    b63 - block
    b747 - block
    b796 - block
    b749 - block
    b940 - block
    b726 - block
    b398 - block
    b403 - block
    b233 - block
    b876 - block
    b171 - block
    b262 - block
    b879 - block
    b969 - block
    b33 - block
    b178 - block
    b470 - block
    b107 - block
    b427 - block
    b727 - block
    b223 - block
    b187 - block
    b815 - block
    b408 - block
    b613 - block
    b162 - block
    b897 - block
    b821 - block
    b790 - block
    b32 - block
    b794 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b918 )
    ( on b518 b918 )
    ( on b972 b518 )
    ( on b620 b972 )
    ( on b204 b620 )
    ( on b201 b204 )
    ( on b777 b201 )
    ( on b63 b777 )
    ( on b747 b63 )
    ( on b796 b747 )
    ( on b749 b796 )
    ( on b940 b749 )
    ( on b726 b940 )
    ( on b398 b726 )
    ( on b403 b398 )
    ( on b233 b403 )
    ( on b876 b233 )
    ( on b171 b876 )
    ( on b262 b171 )
    ( on b879 b262 )
    ( on b969 b879 )
    ( on b33 b969 )
    ( on b178 b33 )
    ( on b470 b178 )
    ( on b107 b470 )
    ( on b427 b107 )
    ( on b727 b427 )
    ( on b223 b727 )
    ( on b187 b223 )
    ( on b815 b187 )
    ( on b408 b815 )
    ( on b613 b408 )
    ( on b162 b613 )
    ( on b897 b162 )
    ( on b821 b897 )
    ( on b790 b821 )
    ( on b32 b790 )
    ( on b794 b32 )
    ( clear b794 )
  )
  ( :goal
    ( and
      ( clear b918 )
    )
  )
)
