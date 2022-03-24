( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b410 - block
    b753 - block
    b872 - block
    b491 - block
    b303 - block
    b350 - block
    b125 - block
    b707 - block
    b9 - block
    b13 - block
    b74 - block
    b555 - block
    b564 - block
    b578 - block
    b514 - block
    b708 - block
    b727 - block
    b546 - block
    b20 - block
    b548 - block
    b259 - block
    b948 - block
    b338 - block
    b78 - block
    b887 - block
    b66 - block
    b927 - block
    b535 - block
    b966 - block
    b782 - block
    b831 - block
    b717 - block
    b268 - block
    b511 - block
    b385 - block
    b290 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b410 )
    ( on b753 b410 )
    ( on b872 b753 )
    ( on b491 b872 )
    ( on b303 b491 )
    ( on b350 b303 )
    ( on b125 b350 )
    ( on b707 b125 )
    ( on b9 b707 )
    ( on b13 b9 )
    ( on b74 b13 )
    ( on b555 b74 )
    ( on b564 b555 )
    ( on b578 b564 )
    ( on b514 b578 )
    ( on b708 b514 )
    ( on b727 b708 )
    ( on b546 b727 )
    ( on b20 b546 )
    ( on b548 b20 )
    ( on b259 b548 )
    ( on b948 b259 )
    ( on b338 b948 )
    ( on b78 b338 )
    ( on b887 b78 )
    ( on b66 b887 )
    ( on b927 b66 )
    ( on b535 b927 )
    ( on b966 b535 )
    ( on b782 b966 )
    ( on b831 b782 )
    ( on b717 b831 )
    ( on b268 b717 )
    ( on b511 b268 )
    ( on b385 b511 )
    ( on b290 b385 )
    ( clear b290 )
  )
  ( :tasks
    ( Make-35Pile b753 b872 b491 b303 b350 b125 b707 b9 b13 b74 b555 b564 b578 b514 b708 b727 b546 b20 b548 b259 b948 b338 b78 b887 b66 b927 b535 b966 b782 b831 b717 b268 b511 b385 b290 )
  )
)
