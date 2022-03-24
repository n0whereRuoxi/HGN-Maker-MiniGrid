( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b583 - block
    b416 - block
    b222 - block
    b145 - block
    b616 - block
    b477 - block
    b42 - block
    b210 - block
    b632 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b583 )
    ( on b416 b583 )
    ( on b222 b416 )
    ( on b145 b222 )
    ( on b616 b145 )
    ( on b477 b616 )
    ( on b42 b477 )
    ( on b210 b42 )
    ( on b632 b210 )
    ( clear b632 )
  )
  ( :tasks
    ( Make-8Pile b416 b222 b145 b616 b477 b42 b210 b632 )
  )
)
