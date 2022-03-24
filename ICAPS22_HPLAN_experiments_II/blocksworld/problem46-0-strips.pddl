( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b731 - block
    b385 - block
    b913 - block
    b555 - block
    b682 - block
    b361 - block
    b791 - block
    b728 - block
    b394 - block
    b833 - block
    b557 - block
    b663 - block
    b851 - block
    b358 - block
    b714 - block
    b337 - block
    b664 - block
    b644 - block
    b649 - block
    b676 - block
    b382 - block
    b395 - block
    b384 - block
    b356 - block
    b585 - block
    b132 - block
    b462 - block
    b471 - block
    b630 - block
    b799 - block
    b274 - block
    b666 - block
    b907 - block
    b881 - block
    b880 - block
    b245 - block
    b195 - block
    b92 - block
    b488 - block
    b681 - block
    b72 - block
    b573 - block
    b523 - block
    b942 - block
    b112 - block
    b860 - block
    b23 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b731 )
    ( on b385 b731 )
    ( on b913 b385 )
    ( on b555 b913 )
    ( on b682 b555 )
    ( on b361 b682 )
    ( on b791 b361 )
    ( on b728 b791 )
    ( on b394 b728 )
    ( on b833 b394 )
    ( on b557 b833 )
    ( on b663 b557 )
    ( on b851 b663 )
    ( on b358 b851 )
    ( on b714 b358 )
    ( on b337 b714 )
    ( on b664 b337 )
    ( on b644 b664 )
    ( on b649 b644 )
    ( on b676 b649 )
    ( on b382 b676 )
    ( on b395 b382 )
    ( on b384 b395 )
    ( on b356 b384 )
    ( on b585 b356 )
    ( on b132 b585 )
    ( on b462 b132 )
    ( on b471 b462 )
    ( on b630 b471 )
    ( on b799 b630 )
    ( on b274 b799 )
    ( on b666 b274 )
    ( on b907 b666 )
    ( on b881 b907 )
    ( on b880 b881 )
    ( on b245 b880 )
    ( on b195 b245 )
    ( on b92 b195 )
    ( on b488 b92 )
    ( on b681 b488 )
    ( on b72 b681 )
    ( on b573 b72 )
    ( on b523 b573 )
    ( on b942 b523 )
    ( on b112 b942 )
    ( on b860 b112 )
    ( on b23 b860 )
    ( clear b23 )
  )
  ( :goal
    ( and
      ( clear b731 )
    )
  )
)
