( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b811 - block
    b492 - block
    b344 - block
    b15 - block
    b443 - block
    b218 - block
    b493 - block
    b553 - block
    b803 - block
    b428 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b811 )
    ( on b492 b811 )
    ( on b344 b492 )
    ( on b15 b344 )
    ( on b443 b15 )
    ( on b218 b443 )
    ( on b493 b218 )
    ( on b553 b493 )
    ( on b803 b553 )
    ( on b428 b803 )
    ( clear b428 )
  )
  ( :tasks
    ( Make-9Pile b492 b344 b15 b443 b218 b493 b553 b803 b428 )
  )
)
