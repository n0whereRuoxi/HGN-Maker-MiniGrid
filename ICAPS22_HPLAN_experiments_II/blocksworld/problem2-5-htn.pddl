( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b150 - block
    b852 - block
    b330 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b150 )
    ( on b852 b150 )
    ( on b330 b852 )
    ( clear b330 )
  )
  ( :tasks
    ( Make-2Pile b852 b330 )
  )
)
