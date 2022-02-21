( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b924 - block
    b807 - block
    b853 - block
    b991 - block
    b140 - block
    b79 - block
    b588 - block
    b384 - block
    b464 - block
    b34 - block
    b271 - block
    b719 - block
    b785 - block
    b335 - block
    b292 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b924 )
    ( on b807 b924 )
    ( on b853 b807 )
    ( on b991 b853 )
    ( on b140 b991 )
    ( on b79 b140 )
    ( on b588 b79 )
    ( on b384 b588 )
    ( on b464 b384 )
    ( on b34 b464 )
    ( on b271 b34 )
    ( on b719 b271 )
    ( on b785 b719 )
    ( on b335 b785 )
    ( on b292 b335 )
    ( clear b292 )
  )
  ( :goal
    ( and
      ( clear b924 )
    )
  )
)
