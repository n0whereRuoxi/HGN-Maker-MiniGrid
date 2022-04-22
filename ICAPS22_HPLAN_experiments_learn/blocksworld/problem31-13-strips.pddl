( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b767 - block
    b648 - block
    b482 - block
    b774 - block
    b939 - block
    b462 - block
    b416 - block
    b607 - block
    b496 - block
    b628 - block
    b958 - block
    b821 - block
    b787 - block
    b127 - block
    b299 - block
    b388 - block
    b4 - block
    b78 - block
    b485 - block
    b343 - block
    b773 - block
    b844 - block
    b808 - block
    b740 - block
    b772 - block
    b296 - block
    b473 - block
    b146 - block
    b776 - block
    b654 - block
    b49 - block
    b484 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b767 )
    ( on b648 b767 )
    ( on b482 b648 )
    ( on b774 b482 )
    ( on b939 b774 )
    ( on b462 b939 )
    ( on b416 b462 )
    ( on b607 b416 )
    ( on b496 b607 )
    ( on b628 b496 )
    ( on b958 b628 )
    ( on b821 b958 )
    ( on b787 b821 )
    ( on b127 b787 )
    ( on b299 b127 )
    ( on b388 b299 )
    ( on b4 b388 )
    ( on b78 b4 )
    ( on b485 b78 )
    ( on b343 b485 )
    ( on b773 b343 )
    ( on b844 b773 )
    ( on b808 b844 )
    ( on b740 b808 )
    ( on b772 b740 )
    ( on b296 b772 )
    ( on b473 b296 )
    ( on b146 b473 )
    ( on b776 b146 )
    ( on b654 b776 )
    ( on b49 b654 )
    ( on b484 b49 )
    ( clear b484 )
  )
  ( :goal
    ( and
      ( clear b767 )
    )
  )
)
