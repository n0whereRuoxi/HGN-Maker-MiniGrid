( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b602 - block
    b362 - block
    b811 - block
    b68 - block
    b195 - block
    b937 - block
    b893 - block
    b267 - block
    b113 - block
    b74 - block
    b972 - block
    b965 - block
    b883 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b602 )
    ( on b362 b602 )
    ( on b811 b362 )
    ( on b68 b811 )
    ( on b195 b68 )
    ( on b937 b195 )
    ( on b893 b937 )
    ( on b267 b893 )
    ( on b113 b267 )
    ( on b74 b113 )
    ( on b972 b74 )
    ( on b965 b972 )
    ( on b883 b965 )
    ( clear b883 )
  )
  ( :tasks
    ( Make-12Pile b362 b811 b68 b195 b937 b893 b267 b113 b74 b972 b965 b883 )
  )
)
