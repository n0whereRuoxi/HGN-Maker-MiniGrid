( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b297 - block
    b517 - block
    b293 - block
    b729 - block
    b352 - block
    b701 - block
    b720 - block
    b536 - block
    b955 - block
    b776 - block
    b538 - block
    b894 - block
    b813 - block
    b523 - block
    b86 - block
    b583 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b297 )
    ( on b517 b297 )
    ( on b293 b517 )
    ( on b729 b293 )
    ( on b352 b729 )
    ( on b701 b352 )
    ( on b720 b701 )
    ( on b536 b720 )
    ( on b955 b536 )
    ( on b776 b955 )
    ( on b538 b776 )
    ( on b894 b538 )
    ( on b813 b894 )
    ( on b523 b813 )
    ( on b86 b523 )
    ( on b583 b86 )
    ( clear b583 )
  )
  ( :tasks
    ( Make-15Pile b517 b293 b729 b352 b701 b720 b536 b955 b776 b538 b894 b813 b523 b86 b583 )
  )
)
