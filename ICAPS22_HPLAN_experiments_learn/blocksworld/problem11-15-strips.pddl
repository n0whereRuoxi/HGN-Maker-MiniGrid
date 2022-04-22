( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b728 - block
    b51 - block
    b527 - block
    b230 - block
    b327 - block
    b80 - block
    b704 - block
    b892 - block
    b763 - block
    b475 - block
    b609 - block
    b635 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b728 )
    ( on b51 b728 )
    ( on b527 b51 )
    ( on b230 b527 )
    ( on b327 b230 )
    ( on b80 b327 )
    ( on b704 b80 )
    ( on b892 b704 )
    ( on b763 b892 )
    ( on b475 b763 )
    ( on b609 b475 )
    ( on b635 b609 )
    ( clear b635 )
  )
  ( :goal
    ( and
      ( clear b728 )
    )
  )
)
