( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b865 - block
    b841 - block
    b397 - block
    b484 - block
    b659 - block
    b58 - block
    b896 - block
    b400 - block
    b60 - block
    b125 - block
    b624 - block
    b887 - block
    b921 - block
    b334 - block
    b26 - block
    b385 - block
    b277 - block
    b660 - block
    b583 - block
    b414 - block
    b905 - block
    b790 - block
    b894 - block
    b614 - block
    b489 - block
    b613 - block
    b398 - block
    b206 - block
    b140 - block
    b738 - block
    b981 - block
    b473 - block
    b308 - block
    b849 - block
    b523 - block
    b597 - block
    b191 - block
    b448 - block
    b910 - block
    b571 - block
    b24 - block
    b478 - block
    b655 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b865 )
    ( on b841 b865 )
    ( on b397 b841 )
    ( on b484 b397 )
    ( on b659 b484 )
    ( on b58 b659 )
    ( on b896 b58 )
    ( on b400 b896 )
    ( on b60 b400 )
    ( on b125 b60 )
    ( on b624 b125 )
    ( on b887 b624 )
    ( on b921 b887 )
    ( on b334 b921 )
    ( on b26 b334 )
    ( on b385 b26 )
    ( on b277 b385 )
    ( on b660 b277 )
    ( on b583 b660 )
    ( on b414 b583 )
    ( on b905 b414 )
    ( on b790 b905 )
    ( on b894 b790 )
    ( on b614 b894 )
    ( on b489 b614 )
    ( on b613 b489 )
    ( on b398 b613 )
    ( on b206 b398 )
    ( on b140 b206 )
    ( on b738 b140 )
    ( on b981 b738 )
    ( on b473 b981 )
    ( on b308 b473 )
    ( on b849 b308 )
    ( on b523 b849 )
    ( on b597 b523 )
    ( on b191 b597 )
    ( on b448 b191 )
    ( on b910 b448 )
    ( on b571 b910 )
    ( on b24 b571 )
    ( on b478 b24 )
    ( on b655 b478 )
    ( clear b655 )
  )
  ( :goal
    ( and
      ( clear b865 )
    )
  )
)
