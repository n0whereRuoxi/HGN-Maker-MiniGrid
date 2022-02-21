( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b942 - block
    b682 - block
    b342 - block
    b486 - block
    b859 - block
    b229 - block
    b138 - block
    b968 - block
    b648 - block
    b433 - block
    b649 - block
    b134 - block
    b79 - block
    b167 - block
    b157 - block
    b865 - block
    b643 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b942 )
    ( on b682 b942 )
    ( on b342 b682 )
    ( on b486 b342 )
    ( on b859 b486 )
    ( on b229 b859 )
    ( on b138 b229 )
    ( on b968 b138 )
    ( on b648 b968 )
    ( on b433 b648 )
    ( on b649 b433 )
    ( on b134 b649 )
    ( on b79 b134 )
    ( on b167 b79 )
    ( on b157 b167 )
    ( on b865 b157 )
    ( on b643 b865 )
    ( clear b643 )
  )
  ( :goal
    ( and
      ( clear b942 )
    )
  )
)
