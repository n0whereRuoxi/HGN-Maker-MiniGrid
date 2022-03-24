( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b718 - block
    b914 - block
    b377 - block
    b970 - block
    b890 - block
    b385 - block
    b874 - block
    b815 - block
    b977 - block
    b942 - block
    b456 - block
    b352 - block
    b62 - block
    b609 - block
    b41 - block
    b432 - block
    b308 - block
    b807 - block
    b409 - block
    b483 - block
    b720 - block
    b975 - block
    b894 - block
    b402 - block
    b917 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b718 )
    ( on b914 b718 )
    ( on b377 b914 )
    ( on b970 b377 )
    ( on b890 b970 )
    ( on b385 b890 )
    ( on b874 b385 )
    ( on b815 b874 )
    ( on b977 b815 )
    ( on b942 b977 )
    ( on b456 b942 )
    ( on b352 b456 )
    ( on b62 b352 )
    ( on b609 b62 )
    ( on b41 b609 )
    ( on b432 b41 )
    ( on b308 b432 )
    ( on b807 b308 )
    ( on b409 b807 )
    ( on b483 b409 )
    ( on b720 b483 )
    ( on b975 b720 )
    ( on b894 b975 )
    ( on b402 b894 )
    ( on b917 b402 )
    ( clear b917 )
  )
  ( :tasks
    ( Make-24Pile b914 b377 b970 b890 b385 b874 b815 b977 b942 b456 b352 b62 b609 b41 b432 b308 b807 b409 b483 b720 b975 b894 b402 b917 )
  )
)
