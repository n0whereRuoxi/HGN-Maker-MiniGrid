( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b808 - block
    b416 - block
    b73 - block
    b865 - block
    b687 - block
    b979 - block
    b460 - block
    b799 - block
    b32 - block
    b478 - block
    b11 - block
    b346 - block
    b738 - block
    b46 - block
    b950 - block
    b838 - block
    b819 - block
    b949 - block
    b762 - block
    b340 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b808 )
    ( on b416 b808 )
    ( on b73 b416 )
    ( on b865 b73 )
    ( on b687 b865 )
    ( on b979 b687 )
    ( on b460 b979 )
    ( on b799 b460 )
    ( on b32 b799 )
    ( on b478 b32 )
    ( on b11 b478 )
    ( on b346 b11 )
    ( on b738 b346 )
    ( on b46 b738 )
    ( on b950 b46 )
    ( on b838 b950 )
    ( on b819 b838 )
    ( on b949 b819 )
    ( on b762 b949 )
    ( on b340 b762 )
    ( clear b340 )
  )
  ( :goal
    ( and
      ( clear b808 )
    )
  )
)
