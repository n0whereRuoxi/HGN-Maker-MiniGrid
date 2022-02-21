( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b299 - block
    b229 - block
    b662 - block
    b296 - block
    b63 - block
    b52 - block
    b554 - block
    b172 - block
    b759 - block
    b917 - block
    b273 - block
    b257 - block
    b448 - block
    b435 - block
    b91 - block
    b237 - block
    b792 - block
    b639 - block
    b76 - block
    b689 - block
    b15 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b299 )
    ( on b229 b299 )
    ( on b662 b229 )
    ( on b296 b662 )
    ( on b63 b296 )
    ( on b52 b63 )
    ( on b554 b52 )
    ( on b172 b554 )
    ( on b759 b172 )
    ( on b917 b759 )
    ( on b273 b917 )
    ( on b257 b273 )
    ( on b448 b257 )
    ( on b435 b448 )
    ( on b91 b435 )
    ( on b237 b91 )
    ( on b792 b237 )
    ( on b639 b792 )
    ( on b76 b639 )
    ( on b689 b76 )
    ( on b15 b689 )
    ( clear b15 )
  )
  ( :goal
    ( and
      ( clear b299 )
    )
  )
)
