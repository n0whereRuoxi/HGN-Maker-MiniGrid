( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b369 - block
    b563 - block
    b471 - block
    b652 - block
    b731 - block
    b709 - block
    b307 - block
    b252 - block
    b466 - block
    b347 - block
    b872 - block
    b218 - block
    b695 - block
    b588 - block
    b760 - block
    b871 - block
    b409 - block
    b64 - block
    b426 - block
    b893 - block
    b708 - block
    b684 - block
    b280 - block
    b983 - block
    b976 - block
    b773 - block
    b505 - block
    b750 - block
    b381 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b369 )
    ( on b563 b369 )
    ( on b471 b563 )
    ( on b652 b471 )
    ( on b731 b652 )
    ( on b709 b731 )
    ( on b307 b709 )
    ( on b252 b307 )
    ( on b466 b252 )
    ( on b347 b466 )
    ( on b872 b347 )
    ( on b218 b872 )
    ( on b695 b218 )
    ( on b588 b695 )
    ( on b760 b588 )
    ( on b871 b760 )
    ( on b409 b871 )
    ( on b64 b409 )
    ( on b426 b64 )
    ( on b893 b426 )
    ( on b708 b893 )
    ( on b684 b708 )
    ( on b280 b684 )
    ( on b983 b280 )
    ( on b976 b983 )
    ( on b773 b976 )
    ( on b505 b773 )
    ( on b750 b505 )
    ( on b381 b750 )
    ( clear b381 )
  )
  ( :goal
    ( and
      ( clear b369 )
    )
  )
)
