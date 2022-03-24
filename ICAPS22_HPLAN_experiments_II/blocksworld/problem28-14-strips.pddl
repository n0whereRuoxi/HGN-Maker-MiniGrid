( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b506 - block
    b215 - block
    b481 - block
    b665 - block
    b876 - block
    b934 - block
    b191 - block
    b496 - block
    b434 - block
    b240 - block
    b276 - block
    b26 - block
    b212 - block
    b637 - block
    b696 - block
    b266 - block
    b101 - block
    b739 - block
    b562 - block
    b317 - block
    b914 - block
    b821 - block
    b798 - block
    b950 - block
    b238 - block
    b202 - block
    b164 - block
    b482 - block
    b512 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b506 )
    ( on b215 b506 )
    ( on b481 b215 )
    ( on b665 b481 )
    ( on b876 b665 )
    ( on b934 b876 )
    ( on b191 b934 )
    ( on b496 b191 )
    ( on b434 b496 )
    ( on b240 b434 )
    ( on b276 b240 )
    ( on b26 b276 )
    ( on b212 b26 )
    ( on b637 b212 )
    ( on b696 b637 )
    ( on b266 b696 )
    ( on b101 b266 )
    ( on b739 b101 )
    ( on b562 b739 )
    ( on b317 b562 )
    ( on b914 b317 )
    ( on b821 b914 )
    ( on b798 b821 )
    ( on b950 b798 )
    ( on b238 b950 )
    ( on b202 b238 )
    ( on b164 b202 )
    ( on b482 b164 )
    ( on b512 b482 )
    ( clear b512 )
  )
  ( :goal
    ( and
      ( clear b506 )
    )
  )
)
