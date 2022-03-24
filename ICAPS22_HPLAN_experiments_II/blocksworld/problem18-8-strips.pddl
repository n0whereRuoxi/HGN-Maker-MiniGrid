( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b607 - block
    b697 - block
    b298 - block
    b789 - block
    b449 - block
    b961 - block
    b143 - block
    b722 - block
    b301 - block
    b354 - block
    b529 - block
    b702 - block
    b920 - block
    b656 - block
    b360 - block
    b880 - block
    b403 - block
    b945 - block
    b101 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b607 )
    ( on b697 b607 )
    ( on b298 b697 )
    ( on b789 b298 )
    ( on b449 b789 )
    ( on b961 b449 )
    ( on b143 b961 )
    ( on b722 b143 )
    ( on b301 b722 )
    ( on b354 b301 )
    ( on b529 b354 )
    ( on b702 b529 )
    ( on b920 b702 )
    ( on b656 b920 )
    ( on b360 b656 )
    ( on b880 b360 )
    ( on b403 b880 )
    ( on b945 b403 )
    ( on b101 b945 )
    ( clear b101 )
  )
  ( :goal
    ( and
      ( clear b607 )
    )
  )
)
