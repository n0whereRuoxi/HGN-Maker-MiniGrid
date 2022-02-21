( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b689 - block
    b972 - block
    b817 - block
    b955 - block
    b707 - block
    b793 - block
    b163 - block
    b540 - block
    b262 - block
    b178 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b689 )
    ( on b972 b689 )
    ( on b817 b972 )
    ( on b955 b817 )
    ( on b707 b955 )
    ( on b793 b707 )
    ( on b163 b793 )
    ( on b540 b163 )
    ( on b262 b540 )
    ( on b178 b262 )
    ( clear b178 )
  )
  ( :goal
    ( and
      ( clear b689 )
    )
  )
)
