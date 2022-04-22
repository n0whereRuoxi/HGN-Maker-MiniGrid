( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b242 - block
    b649 - block
    b827 - block
    b448 - block
    b832 - block
    b294 - block
    b719 - block
    b980 - block
    b668 - block
    b386 - block
    b307 - block
    b503 - block
    b730 - block
    b441 - block
    b724 - block
    b691 - block
    b371 - block
    b258 - block
    b321 - block
    b311 - block
    b74 - block
    b476 - block
    b335 - block
    b862 - block
    b481 - block
    b570 - block
    b626 - block
    b181 - block
    b326 - block
    b279 - block
    b284 - block
    b657 - block
    b436 - block
    b125 - block
    b616 - block
    b659 - block
    b358 - block
    b699 - block
    b765 - block
    b281 - block
    b555 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b242 )
    ( on b649 b242 )
    ( on b827 b649 )
    ( on b448 b827 )
    ( on b832 b448 )
    ( on b294 b832 )
    ( on b719 b294 )
    ( on b980 b719 )
    ( on b668 b980 )
    ( on b386 b668 )
    ( on b307 b386 )
    ( on b503 b307 )
    ( on b730 b503 )
    ( on b441 b730 )
    ( on b724 b441 )
    ( on b691 b724 )
    ( on b371 b691 )
    ( on b258 b371 )
    ( on b321 b258 )
    ( on b311 b321 )
    ( on b74 b311 )
    ( on b476 b74 )
    ( on b335 b476 )
    ( on b862 b335 )
    ( on b481 b862 )
    ( on b570 b481 )
    ( on b626 b570 )
    ( on b181 b626 )
    ( on b326 b181 )
    ( on b279 b326 )
    ( on b284 b279 )
    ( on b657 b284 )
    ( on b436 b657 )
    ( on b125 b436 )
    ( on b616 b125 )
    ( on b659 b616 )
    ( on b358 b659 )
    ( on b699 b358 )
    ( on b765 b699 )
    ( on b281 b765 )
    ( on b555 b281 )
    ( clear b555 )
  )
  ( :goal
    ( and
      ( clear b242 )
    )
  )
)
