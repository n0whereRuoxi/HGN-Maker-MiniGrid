( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b216 - block
    b378 - block
    b203 - block
    b177 - block
    b25 - block
    b181 - block
    b556 - block
    b198 - block
    b905 - block
    b913 - block
    b533 - block
    b424 - block
    b204 - block
    b453 - block
    b173 - block
    b914 - block
    b215 - block
    b255 - block
    b265 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b216 )
    ( on b378 b216 )
    ( on b203 b378 )
    ( on b177 b203 )
    ( on b25 b177 )
    ( on b181 b25 )
    ( on b556 b181 )
    ( on b198 b556 )
    ( on b905 b198 )
    ( on b913 b905 )
    ( on b533 b913 )
    ( on b424 b533 )
    ( on b204 b424 )
    ( on b453 b204 )
    ( on b173 b453 )
    ( on b914 b173 )
    ( on b215 b914 )
    ( on b255 b215 )
    ( on b265 b255 )
    ( clear b265 )
  )
  ( :goal
    ( and
      ( clear b216 )
    )
  )
)
