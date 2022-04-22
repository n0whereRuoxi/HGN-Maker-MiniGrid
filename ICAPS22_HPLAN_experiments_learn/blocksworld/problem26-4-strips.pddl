( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b87 - block
    b345 - block
    b859 - block
    b847 - block
    b20 - block
    b454 - block
    b511 - block
    b162 - block
    b905 - block
    b70 - block
    b745 - block
    b266 - block
    b790 - block
    b978 - block
    b665 - block
    b286 - block
    b199 - block
    b128 - block
    b457 - block
    b705 - block
    b459 - block
    b696 - block
    b233 - block
    b149 - block
    b538 - block
    b577 - block
    b129 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b87 )
    ( on b345 b87 )
    ( on b859 b345 )
    ( on b847 b859 )
    ( on b20 b847 )
    ( on b454 b20 )
    ( on b511 b454 )
    ( on b162 b511 )
    ( on b905 b162 )
    ( on b70 b905 )
    ( on b745 b70 )
    ( on b266 b745 )
    ( on b790 b266 )
    ( on b978 b790 )
    ( on b665 b978 )
    ( on b286 b665 )
    ( on b199 b286 )
    ( on b128 b199 )
    ( on b457 b128 )
    ( on b705 b457 )
    ( on b459 b705 )
    ( on b696 b459 )
    ( on b233 b696 )
    ( on b149 b233 )
    ( on b538 b149 )
    ( on b577 b538 )
    ( on b129 b577 )
    ( clear b129 )
  )
  ( :goal
    ( and
      ( clear b87 )
    )
  )
)
