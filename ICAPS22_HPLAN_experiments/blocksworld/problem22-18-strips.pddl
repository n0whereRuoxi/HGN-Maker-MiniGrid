( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b138 - block
    b975 - block
    b294 - block
    b127 - block
    b403 - block
    b512 - block
    b981 - block
    b550 - block
    b817 - block
    b558 - block
    b920 - block
    b977 - block
    b588 - block
    b264 - block
    b864 - block
    b607 - block
    b955 - block
    b255 - block
    b555 - block
    b245 - block
    b683 - block
    b158 - block
    b778 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b138 )
    ( on b975 b138 )
    ( on b294 b975 )
    ( on b127 b294 )
    ( on b403 b127 )
    ( on b512 b403 )
    ( on b981 b512 )
    ( on b550 b981 )
    ( on b817 b550 )
    ( on b558 b817 )
    ( on b920 b558 )
    ( on b977 b920 )
    ( on b588 b977 )
    ( on b264 b588 )
    ( on b864 b264 )
    ( on b607 b864 )
    ( on b955 b607 )
    ( on b255 b955 )
    ( on b555 b255 )
    ( on b245 b555 )
    ( on b683 b245 )
    ( on b158 b683 )
    ( on b778 b158 )
    ( clear b778 )
  )
  ( :goal
    ( and
      ( clear b138 )
    )
  )
)
