( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b390 - block
    b962 - block
    b225 - block
    b35 - block
    b283 - block
    b53 - block
    b670 - block
    b795 - block
    b708 - block
    b184 - block
    b485 - block
    b9 - block
    b598 - block
    b626 - block
    b650 - block
    b394 - block
    b963 - block
    b155 - block
    b372 - block
    b80 - block
    b429 - block
    b227 - block
    b64 - block
    b498 - block
    b776 - block
    b549 - block
    b51 - block
    b449 - block
    b656 - block
    b275 - block
    b853 - block
    b569 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b390 )
    ( on b962 b390 )
    ( on b225 b962 )
    ( on b35 b225 )
    ( on b283 b35 )
    ( on b53 b283 )
    ( on b670 b53 )
    ( on b795 b670 )
    ( on b708 b795 )
    ( on b184 b708 )
    ( on b485 b184 )
    ( on b9 b485 )
    ( on b598 b9 )
    ( on b626 b598 )
    ( on b650 b626 )
    ( on b394 b650 )
    ( on b963 b394 )
    ( on b155 b963 )
    ( on b372 b155 )
    ( on b80 b372 )
    ( on b429 b80 )
    ( on b227 b429 )
    ( on b64 b227 )
    ( on b498 b64 )
    ( on b776 b498 )
    ( on b549 b776 )
    ( on b51 b549 )
    ( on b449 b51 )
    ( on b656 b449 )
    ( on b275 b656 )
    ( on b853 b275 )
    ( on b569 b853 )
    ( clear b569 )
  )
  ( :tasks
    ( Make-31Pile b962 b225 b35 b283 b53 b670 b795 b708 b184 b485 b9 b598 b626 b650 b394 b963 b155 b372 b80 b429 b227 b64 b498 b776 b549 b51 b449 b656 b275 b853 b569 )
  )
)
