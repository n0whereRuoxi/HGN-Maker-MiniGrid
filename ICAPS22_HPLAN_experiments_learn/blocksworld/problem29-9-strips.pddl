( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b795 - block
    b958 - block
    b68 - block
    b421 - block
    b855 - block
    b819 - block
    b707 - block
    b131 - block
    b199 - block
    b295 - block
    b108 - block
    b921 - block
    b940 - block
    b494 - block
    b541 - block
    b930 - block
    b303 - block
    b70 - block
    b809 - block
    b844 - block
    b615 - block
    b147 - block
    b44 - block
    b111 - block
    b619 - block
    b848 - block
    b620 - block
    b466 - block
    b233 - block
    b638 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b795 )
    ( on b958 b795 )
    ( on b68 b958 )
    ( on b421 b68 )
    ( on b855 b421 )
    ( on b819 b855 )
    ( on b707 b819 )
    ( on b131 b707 )
    ( on b199 b131 )
    ( on b295 b199 )
    ( on b108 b295 )
    ( on b921 b108 )
    ( on b940 b921 )
    ( on b494 b940 )
    ( on b541 b494 )
    ( on b930 b541 )
    ( on b303 b930 )
    ( on b70 b303 )
    ( on b809 b70 )
    ( on b844 b809 )
    ( on b615 b844 )
    ( on b147 b615 )
    ( on b44 b147 )
    ( on b111 b44 )
    ( on b619 b111 )
    ( on b848 b619 )
    ( on b620 b848 )
    ( on b466 b620 )
    ( on b233 b466 )
    ( on b638 b233 )
    ( clear b638 )
  )
  ( :goal
    ( and
      ( clear b795 )
    )
  )
)
