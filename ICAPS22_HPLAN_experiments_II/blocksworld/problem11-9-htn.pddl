( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b387 - block
    b97 - block
    b357 - block
    b927 - block
    b359 - block
    b356 - block
    b214 - block
    b236 - block
    b240 - block
    b924 - block
    b581 - block
    b874 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b387 )
    ( on b97 b387 )
    ( on b357 b97 )
    ( on b927 b357 )
    ( on b359 b927 )
    ( on b356 b359 )
    ( on b214 b356 )
    ( on b236 b214 )
    ( on b240 b236 )
    ( on b924 b240 )
    ( on b581 b924 )
    ( on b874 b581 )
    ( clear b874 )
  )
  ( :tasks
    ( Make-11Pile b97 b357 b927 b359 b356 b214 b236 b240 b924 b581 b874 )
  )
)
