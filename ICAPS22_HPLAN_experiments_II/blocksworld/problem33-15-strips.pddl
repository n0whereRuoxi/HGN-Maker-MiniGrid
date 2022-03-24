( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b964 - block
    b605 - block
    b820 - block
    b874 - block
    b302 - block
    b53 - block
    b868 - block
    b387 - block
    b563 - block
    b104 - block
    b738 - block
    b799 - block
    b469 - block
    b282 - block
    b722 - block
    b176 - block
    b117 - block
    b553 - block
    b830 - block
    b519 - block
    b54 - block
    b644 - block
    b442 - block
    b775 - block
    b243 - block
    b643 - block
    b185 - block
    b889 - block
    b622 - block
    b603 - block
    b706 - block
    b566 - block
    b137 - block
    b635 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b964 )
    ( on b605 b964 )
    ( on b820 b605 )
    ( on b874 b820 )
    ( on b302 b874 )
    ( on b53 b302 )
    ( on b868 b53 )
    ( on b387 b868 )
    ( on b563 b387 )
    ( on b104 b563 )
    ( on b738 b104 )
    ( on b799 b738 )
    ( on b469 b799 )
    ( on b282 b469 )
    ( on b722 b282 )
    ( on b176 b722 )
    ( on b117 b176 )
    ( on b553 b117 )
    ( on b830 b553 )
    ( on b519 b830 )
    ( on b54 b519 )
    ( on b644 b54 )
    ( on b442 b644 )
    ( on b775 b442 )
    ( on b243 b775 )
    ( on b643 b243 )
    ( on b185 b643 )
    ( on b889 b185 )
    ( on b622 b889 )
    ( on b603 b622 )
    ( on b706 b603 )
    ( on b566 b706 )
    ( on b137 b566 )
    ( on b635 b137 )
    ( clear b635 )
  )
  ( :goal
    ( and
      ( clear b964 )
    )
  )
)
