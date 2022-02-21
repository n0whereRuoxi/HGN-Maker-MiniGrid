( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b516 - block
    b854 - block
    b245 - block
    b200 - block
    b725 - block
    b613 - block
    b827 - block
    b632 - block
    b275 - block
    b384 - block
    b38 - block
    b648 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b516 )
    ( on b854 b516 )
    ( on b245 b854 )
    ( on b200 b245 )
    ( on b725 b200 )
    ( on b613 b725 )
    ( on b827 b613 )
    ( on b632 b827 )
    ( on b275 b632 )
    ( on b384 b275 )
    ( on b38 b384 )
    ( on b648 b38 )
    ( clear b648 )
  )
  ( :goal
    ( and
      ( clear b516 )
    )
  )
)
