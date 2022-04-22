( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b371 - block
    b18 - block
    b41 - block
    b958 - block
    b802 - block
    b989 - block
    b949 - block
    b40 - block
    b9 - block
    b451 - block
    b943 - block
    b567 - block
    b214 - block
    b972 - block
    b858 - block
    b315 - block
    b928 - block
    b108 - block
    b5 - block
    b381 - block
    b674 - block
    b373 - block
    b619 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b371 )
    ( on b18 b371 )
    ( on b41 b18 )
    ( on b958 b41 )
    ( on b802 b958 )
    ( on b989 b802 )
    ( on b949 b989 )
    ( on b40 b949 )
    ( on b9 b40 )
    ( on b451 b9 )
    ( on b943 b451 )
    ( on b567 b943 )
    ( on b214 b567 )
    ( on b972 b214 )
    ( on b858 b972 )
    ( on b315 b858 )
    ( on b928 b315 )
    ( on b108 b928 )
    ( on b5 b108 )
    ( on b381 b5 )
    ( on b674 b381 )
    ( on b373 b674 )
    ( on b619 b373 )
    ( clear b619 )
  )
  ( :goal
    ( and
      ( clear b371 )
    )
  )
)
