( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b22 - block
    b868 - block
    b562 - block
    b689 - block
    b935 - block
    b519 - block
    b733 - block
    b451 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b22 )
    ( on b868 b22 )
    ( on b562 b868 )
    ( on b689 b562 )
    ( on b935 b689 )
    ( on b519 b935 )
    ( on b733 b519 )
    ( on b451 b733 )
    ( clear b451 )
  )
  ( :tasks
    ( Make-7Pile b868 b562 b689 b935 b519 b733 b451 )
  )
)
