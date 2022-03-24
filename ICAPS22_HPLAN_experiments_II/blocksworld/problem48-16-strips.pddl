( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b853 - block
    b479 - block
    b402 - block
    b511 - block
    b473 - block
    b657 - block
    b29 - block
    b359 - block
    b488 - block
    b536 - block
    b650 - block
    b970 - block
    b864 - block
    b234 - block
    b85 - block
    b278 - block
    b305 - block
    b721 - block
    b988 - block
    b320 - block
    b681 - block
    b559 - block
    b335 - block
    b967 - block
    b394 - block
    b358 - block
    b676 - block
    b859 - block
    b34 - block
    b437 - block
    b304 - block
    b172 - block
    b401 - block
    b956 - block
    b54 - block
    b938 - block
    b660 - block
    b774 - block
    b209 - block
    b96 - block
    b987 - block
    b631 - block
    b162 - block
    b214 - block
    b475 - block
    b56 - block
    b800 - block
    b325 - block
    b341 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b853 )
    ( on b479 b853 )
    ( on b402 b479 )
    ( on b511 b402 )
    ( on b473 b511 )
    ( on b657 b473 )
    ( on b29 b657 )
    ( on b359 b29 )
    ( on b488 b359 )
    ( on b536 b488 )
    ( on b650 b536 )
    ( on b970 b650 )
    ( on b864 b970 )
    ( on b234 b864 )
    ( on b85 b234 )
    ( on b278 b85 )
    ( on b305 b278 )
    ( on b721 b305 )
    ( on b988 b721 )
    ( on b320 b988 )
    ( on b681 b320 )
    ( on b559 b681 )
    ( on b335 b559 )
    ( on b967 b335 )
    ( on b394 b967 )
    ( on b358 b394 )
    ( on b676 b358 )
    ( on b859 b676 )
    ( on b34 b859 )
    ( on b437 b34 )
    ( on b304 b437 )
    ( on b172 b304 )
    ( on b401 b172 )
    ( on b956 b401 )
    ( on b54 b956 )
    ( on b938 b54 )
    ( on b660 b938 )
    ( on b774 b660 )
    ( on b209 b774 )
    ( on b96 b209 )
    ( on b987 b96 )
    ( on b631 b987 )
    ( on b162 b631 )
    ( on b214 b162 )
    ( on b475 b214 )
    ( on b56 b475 )
    ( on b800 b56 )
    ( on b325 b800 )
    ( on b341 b325 )
    ( clear b341 )
  )
  ( :goal
    ( and
      ( clear b853 )
    )
  )
)
