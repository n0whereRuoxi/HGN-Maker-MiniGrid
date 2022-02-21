( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b778 - block
    b49 - block
    b399 - block
    b726 - block
    b852 - block
    b264 - block
    b235 - block
    b381 - block
    b398 - block
    b669 - block
    b303 - block
    b813 - block
    b225 - block
    b758 - block
    b257 - block
    b71 - block
    b750 - block
    b82 - block
    b184 - block
    b934 - block
    b816 - block
    b696 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b778 )
    ( on b49 b778 )
    ( on b399 b49 )
    ( on b726 b399 )
    ( on b852 b726 )
    ( on b264 b852 )
    ( on b235 b264 )
    ( on b381 b235 )
    ( on b398 b381 )
    ( on b669 b398 )
    ( on b303 b669 )
    ( on b813 b303 )
    ( on b225 b813 )
    ( on b758 b225 )
    ( on b257 b758 )
    ( on b71 b257 )
    ( on b750 b71 )
    ( on b82 b750 )
    ( on b184 b82 )
    ( on b934 b184 )
    ( on b816 b934 )
    ( on b696 b816 )
    ( clear b696 )
  )
  ( :goal
    ( and
      ( clear b778 )
    )
  )
)
