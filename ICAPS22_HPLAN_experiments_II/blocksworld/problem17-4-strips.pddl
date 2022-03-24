( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b165 - block
    b538 - block
    b221 - block
    b994 - block
    b907 - block
    b210 - block
    b370 - block
    b897 - block
    b927 - block
    b678 - block
    b856 - block
    b478 - block
    b993 - block
    b905 - block
    b575 - block
    b401 - block
    b624 - block
    b80 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b165 )
    ( on b538 b165 )
    ( on b221 b538 )
    ( on b994 b221 )
    ( on b907 b994 )
    ( on b210 b907 )
    ( on b370 b210 )
    ( on b897 b370 )
    ( on b927 b897 )
    ( on b678 b927 )
    ( on b856 b678 )
    ( on b478 b856 )
    ( on b993 b478 )
    ( on b905 b993 )
    ( on b575 b905 )
    ( on b401 b575 )
    ( on b624 b401 )
    ( on b80 b624 )
    ( clear b80 )
  )
  ( :goal
    ( and
      ( clear b165 )
    )
  )
)
