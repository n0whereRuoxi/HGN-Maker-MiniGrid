( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b701 - block
    b215 - block
    b694 - block
    b214 - block
    b492 - block
    b769 - block
    b973 - block
    b989 - block
    b542 - block
    b426 - block
    b69 - block
    b997 - block
    b286 - block
    b644 - block
    b434 - block
    b333 - block
    b833 - block
    b270 - block
    b413 - block
    b785 - block
    b398 - block
    b902 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b701 )
    ( on b215 b701 )
    ( on b694 b215 )
    ( on b214 b694 )
    ( on b492 b214 )
    ( on b769 b492 )
    ( on b973 b769 )
    ( on b989 b973 )
    ( on b542 b989 )
    ( on b426 b542 )
    ( on b69 b426 )
    ( on b997 b69 )
    ( on b286 b997 )
    ( on b644 b286 )
    ( on b434 b644 )
    ( on b333 b434 )
    ( on b833 b333 )
    ( on b270 b833 )
    ( on b413 b270 )
    ( on b785 b413 )
    ( on b398 b785 )
    ( on b902 b398 )
    ( clear b902 )
  )
  ( :tasks
    ( Make-21Pile b215 b694 b214 b492 b769 b973 b989 b542 b426 b69 b997 b286 b644 b434 b333 b833 b270 b413 b785 b398 b902 )
  )
)
