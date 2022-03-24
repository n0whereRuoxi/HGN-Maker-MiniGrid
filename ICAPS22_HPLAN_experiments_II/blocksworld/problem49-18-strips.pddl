( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b495 - block
    b190 - block
    b687 - block
    b580 - block
    b586 - block
    b734 - block
    b243 - block
    b14 - block
    b772 - block
    b43 - block
    b483 - block
    b917 - block
    b996 - block
    b87 - block
    b424 - block
    b723 - block
    b991 - block
    b309 - block
    b858 - block
    b581 - block
    b117 - block
    b456 - block
    b566 - block
    b299 - block
    b349 - block
    b616 - block
    b978 - block
    b487 - block
    b921 - block
    b674 - block
    b120 - block
    b557 - block
    b836 - block
    b467 - block
    b223 - block
    b764 - block
    b573 - block
    b440 - block
    b846 - block
    b620 - block
    b407 - block
    b979 - block
    b119 - block
    b923 - block
    b913 - block
    b880 - block
    b228 - block
    b969 - block
    b62 - block
    b667 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b495 )
    ( on b190 b495 )
    ( on b687 b190 )
    ( on b580 b687 )
    ( on b586 b580 )
    ( on b734 b586 )
    ( on b243 b734 )
    ( on b14 b243 )
    ( on b772 b14 )
    ( on b43 b772 )
    ( on b483 b43 )
    ( on b917 b483 )
    ( on b996 b917 )
    ( on b87 b996 )
    ( on b424 b87 )
    ( on b723 b424 )
    ( on b991 b723 )
    ( on b309 b991 )
    ( on b858 b309 )
    ( on b581 b858 )
    ( on b117 b581 )
    ( on b456 b117 )
    ( on b566 b456 )
    ( on b299 b566 )
    ( on b349 b299 )
    ( on b616 b349 )
    ( on b978 b616 )
    ( on b487 b978 )
    ( on b921 b487 )
    ( on b674 b921 )
    ( on b120 b674 )
    ( on b557 b120 )
    ( on b836 b557 )
    ( on b467 b836 )
    ( on b223 b467 )
    ( on b764 b223 )
    ( on b573 b764 )
    ( on b440 b573 )
    ( on b846 b440 )
    ( on b620 b846 )
    ( on b407 b620 )
    ( on b979 b407 )
    ( on b119 b979 )
    ( on b923 b119 )
    ( on b913 b923 )
    ( on b880 b913 )
    ( on b228 b880 )
    ( on b969 b228 )
    ( on b62 b969 )
    ( on b667 b62 )
    ( clear b667 )
  )
  ( :goal
    ( and
      ( clear b495 )
    )
  )
)
