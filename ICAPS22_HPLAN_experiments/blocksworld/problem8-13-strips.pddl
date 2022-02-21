( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b501 - block
    b741 - block
    b26 - block
    b776 - block
    b673 - block
    b533 - block
    b651 - block
    b841 - block
    b85 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b501 )
    ( on b741 b501 )
    ( on b26 b741 )
    ( on b776 b26 )
    ( on b673 b776 )
    ( on b533 b673 )
    ( on b651 b533 )
    ( on b841 b651 )
    ( on b85 b841 )
    ( clear b85 )
  )
  ( :goal
    ( and
      ( clear b501 )
    )
  )
)
