( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b296 - block
    b13 - block
    b451 - block
    b755 - block
    b665 - block
    b972 - block
    b175 - block
    b455 - block
    b188 - block
    b105 - block
    b192 - block
    b909 - block
    b729 - block
    b610 - block
    b852 - block
    b24 - block
    b453 - block
    b245 - block
    b535 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b296 )
    ( on b13 b296 )
    ( on b451 b13 )
    ( on b755 b451 )
    ( on b665 b755 )
    ( on b972 b665 )
    ( on b175 b972 )
    ( on b455 b175 )
    ( on b188 b455 )
    ( on b105 b188 )
    ( on b192 b105 )
    ( on b909 b192 )
    ( on b729 b909 )
    ( on b610 b729 )
    ( on b852 b610 )
    ( on b24 b852 )
    ( on b453 b24 )
    ( on b245 b453 )
    ( on b535 b245 )
    ( clear b535 )
  )
  ( :goal
    ( and
      ( clear b296 )
    )
  )
)
