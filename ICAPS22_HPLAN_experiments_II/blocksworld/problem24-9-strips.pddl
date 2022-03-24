( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b70 - block
    b788 - block
    b395 - block
    b776 - block
    b129 - block
    b77 - block
    b493 - block
    b810 - block
    b230 - block
    b629 - block
    b209 - block
    b358 - block
    b141 - block
    b586 - block
    b561 - block
    b53 - block
    b281 - block
    b381 - block
    b994 - block
    b765 - block
    b387 - block
    b89 - block
    b709 - block
    b483 - block
    b487 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b70 )
    ( on b788 b70 )
    ( on b395 b788 )
    ( on b776 b395 )
    ( on b129 b776 )
    ( on b77 b129 )
    ( on b493 b77 )
    ( on b810 b493 )
    ( on b230 b810 )
    ( on b629 b230 )
    ( on b209 b629 )
    ( on b358 b209 )
    ( on b141 b358 )
    ( on b586 b141 )
    ( on b561 b586 )
    ( on b53 b561 )
    ( on b281 b53 )
    ( on b381 b281 )
    ( on b994 b381 )
    ( on b765 b994 )
    ( on b387 b765 )
    ( on b89 b387 )
    ( on b709 b89 )
    ( on b483 b709 )
    ( on b487 b483 )
    ( clear b487 )
  )
  ( :goal
    ( and
      ( clear b70 )
    )
  )
)
