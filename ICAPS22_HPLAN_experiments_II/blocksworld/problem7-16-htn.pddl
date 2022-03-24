( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b828 - block
    b909 - block
    b868 - block
    b615 - block
    b724 - block
    b585 - block
    b784 - block
    b316 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b828 )
    ( on b909 b828 )
    ( on b868 b909 )
    ( on b615 b868 )
    ( on b724 b615 )
    ( on b585 b724 )
    ( on b784 b585 )
    ( on b316 b784 )
    ( clear b316 )
  )
  ( :tasks
    ( Make-7Pile b909 b868 b615 b724 b585 b784 b316 )
  )
)
