( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b418 - block
    b678 - block
    b716 - block
    b583 - block
    b855 - block
    b604 - block
    b439 - block
    b661 - block
    b14 - block
    b398 - block
    b928 - block
    b489 - block
    b775 - block
    b191 - block
    b170 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b418 )
    ( on b678 b418 )
    ( on b716 b678 )
    ( on b583 b716 )
    ( on b855 b583 )
    ( on b604 b855 )
    ( on b439 b604 )
    ( on b661 b439 )
    ( on b14 b661 )
    ( on b398 b14 )
    ( on b928 b398 )
    ( on b489 b928 )
    ( on b775 b489 )
    ( on b191 b775 )
    ( on b170 b191 )
    ( clear b170 )
  )
  ( :tasks
    ( Make-14Pile b678 b716 b583 b855 b604 b439 b661 b14 b398 b928 b489 b775 b191 b170 )
  )
)
