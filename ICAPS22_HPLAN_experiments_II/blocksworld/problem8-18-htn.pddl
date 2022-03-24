( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b874 - block
    b765 - block
    b850 - block
    b842 - block
    b586 - block
    b559 - block
    b149 - block
    b249 - block
    b381 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b874 )
    ( on b765 b874 )
    ( on b850 b765 )
    ( on b842 b850 )
    ( on b586 b842 )
    ( on b559 b586 )
    ( on b149 b559 )
    ( on b249 b149 )
    ( on b381 b249 )
    ( clear b381 )
  )
  ( :tasks
    ( Make-8Pile b765 b850 b842 b586 b559 b149 b249 b381 )
  )
)
