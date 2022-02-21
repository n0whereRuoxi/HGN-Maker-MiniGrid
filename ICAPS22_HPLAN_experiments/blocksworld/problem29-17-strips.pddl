( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b147 - block
    b741 - block
    b32 - block
    b843 - block
    b716 - block
    b551 - block
    b596 - block
    b720 - block
    b703 - block
    b972 - block
    b453 - block
    b140 - block
    b635 - block
    b563 - block
    b346 - block
    b503 - block
    b376 - block
    b395 - block
    b611 - block
    b9 - block
    b46 - block
    b177 - block
    b729 - block
    b830 - block
    b583 - block
    b96 - block
    b643 - block
    b836 - block
    b61 - block
    b164 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b147 )
    ( on b741 b147 )
    ( on b32 b741 )
    ( on b843 b32 )
    ( on b716 b843 )
    ( on b551 b716 )
    ( on b596 b551 )
    ( on b720 b596 )
    ( on b703 b720 )
    ( on b972 b703 )
    ( on b453 b972 )
    ( on b140 b453 )
    ( on b635 b140 )
    ( on b563 b635 )
    ( on b346 b563 )
    ( on b503 b346 )
    ( on b376 b503 )
    ( on b395 b376 )
    ( on b611 b395 )
    ( on b9 b611 )
    ( on b46 b9 )
    ( on b177 b46 )
    ( on b729 b177 )
    ( on b830 b729 )
    ( on b583 b830 )
    ( on b96 b583 )
    ( on b643 b96 )
    ( on b836 b643 )
    ( on b61 b836 )
    ( on b164 b61 )
    ( clear b164 )
  )
  ( :goal
    ( and
      ( clear b147 )
    )
  )
)
