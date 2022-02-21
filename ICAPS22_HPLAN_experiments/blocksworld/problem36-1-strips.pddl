( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b516 - block
    b75 - block
    b455 - block
    b16 - block
    b747 - block
    b741 - block
    b438 - block
    b480 - block
    b411 - block
    b716 - block
    b557 - block
    b377 - block
    b993 - block
    b805 - block
    b342 - block
    b159 - block
    b967 - block
    b505 - block
    b742 - block
    b784 - block
    b303 - block
    b886 - block
    b94 - block
    b304 - block
    b808 - block
    b920 - block
    b698 - block
    b586 - block
    b194 - block
    b44 - block
    b108 - block
    b731 - block
    b259 - block
    b18 - block
    b483 - block
    b545 - block
    b250 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b516 )
    ( on b75 b516 )
    ( on b455 b75 )
    ( on b16 b455 )
    ( on b747 b16 )
    ( on b741 b747 )
    ( on b438 b741 )
    ( on b480 b438 )
    ( on b411 b480 )
    ( on b716 b411 )
    ( on b557 b716 )
    ( on b377 b557 )
    ( on b993 b377 )
    ( on b805 b993 )
    ( on b342 b805 )
    ( on b159 b342 )
    ( on b967 b159 )
    ( on b505 b967 )
    ( on b742 b505 )
    ( on b784 b742 )
    ( on b303 b784 )
    ( on b886 b303 )
    ( on b94 b886 )
    ( on b304 b94 )
    ( on b808 b304 )
    ( on b920 b808 )
    ( on b698 b920 )
    ( on b586 b698 )
    ( on b194 b586 )
    ( on b44 b194 )
    ( on b108 b44 )
    ( on b731 b108 )
    ( on b259 b731 )
    ( on b18 b259 )
    ( on b483 b18 )
    ( on b545 b483 )
    ( on b250 b545 )
    ( clear b250 )
  )
  ( :goal
    ( and
      ( clear b516 )
    )
  )
)
