( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b838 - block
    b763 - block
    b759 - block
    b761 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b838 )
    ( on b763 b838 )
    ( on b759 b763 )
    ( on b761 b759 )
    ( clear b761 )
  )
  ( :tasks
    ( Make-3Pile b763 b759 b761 )
  )
)
