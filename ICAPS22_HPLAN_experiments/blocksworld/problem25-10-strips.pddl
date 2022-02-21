( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b496 - block
    b799 - block
    b740 - block
    b200 - block
    b123 - block
    b151 - block
    b72 - block
    b863 - block
    b534 - block
    b720 - block
    b276 - block
    b273 - block
    b313 - block
    b918 - block
    b158 - block
    b322 - block
    b789 - block
    b405 - block
    b686 - block
    b241 - block
    b797 - block
    b182 - block
    b946 - block
    b169 - block
    b225 - block
    b69 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b496 )
    ( on b799 b496 )
    ( on b740 b799 )
    ( on b200 b740 )
    ( on b123 b200 )
    ( on b151 b123 )
    ( on b72 b151 )
    ( on b863 b72 )
    ( on b534 b863 )
    ( on b720 b534 )
    ( on b276 b720 )
    ( on b273 b276 )
    ( on b313 b273 )
    ( on b918 b313 )
    ( on b158 b918 )
    ( on b322 b158 )
    ( on b789 b322 )
    ( on b405 b789 )
    ( on b686 b405 )
    ( on b241 b686 )
    ( on b797 b241 )
    ( on b182 b797 )
    ( on b946 b182 )
    ( on b169 b946 )
    ( on b225 b169 )
    ( on b69 b225 )
    ( clear b69 )
  )
  ( :goal
    ( and
      ( clear b496 )
    )
  )
)
