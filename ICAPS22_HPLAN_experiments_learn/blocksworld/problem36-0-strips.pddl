( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b574 - block
    b413 - block
    b786 - block
    b881 - block
    b571 - block
    b64 - block
    b471 - block
    b896 - block
    b514 - block
    b669 - block
    b963 - block
    b74 - block
    b497 - block
    b590 - block
    b278 - block
    b536 - block
    b531 - block
    b225 - block
    b841 - block
    b263 - block
    b399 - block
    b82 - block
    b972 - block
    b489 - block
    b709 - block
    b838 - block
    b664 - block
    b644 - block
    b891 - block
    b563 - block
    b163 - block
    b617 - block
    b727 - block
    b794 - block
    b720 - block
    b499 - block
    b852 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b574 )
    ( on b413 b574 )
    ( on b786 b413 )
    ( on b881 b786 )
    ( on b571 b881 )
    ( on b64 b571 )
    ( on b471 b64 )
    ( on b896 b471 )
    ( on b514 b896 )
    ( on b669 b514 )
    ( on b963 b669 )
    ( on b74 b963 )
    ( on b497 b74 )
    ( on b590 b497 )
    ( on b278 b590 )
    ( on b536 b278 )
    ( on b531 b536 )
    ( on b225 b531 )
    ( on b841 b225 )
    ( on b263 b841 )
    ( on b399 b263 )
    ( on b82 b399 )
    ( on b972 b82 )
    ( on b489 b972 )
    ( on b709 b489 )
    ( on b838 b709 )
    ( on b664 b838 )
    ( on b644 b664 )
    ( on b891 b644 )
    ( on b563 b891 )
    ( on b163 b563 )
    ( on b617 b163 )
    ( on b727 b617 )
    ( on b794 b727 )
    ( on b720 b794 )
    ( on b499 b720 )
    ( on b852 b499 )
    ( clear b852 )
  )
  ( :goal
    ( and
      ( clear b574 )
    )
  )
)
