( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b706 - block
    b200 - block
    b199 - block
    b365 - block
    b731 - block
    b733 - block
    b23 - block
    b152 - block
    b655 - block
    b582 - block
    b926 - block
    b485 - block
    b419 - block
    b513 - block
    b992 - block
    b563 - block
    b471 - block
    b339 - block
    b898 - block
    b212 - block
    b45 - block
    b592 - block
    b8 - block
    b423 - block
    b776 - block
    b320 - block
    b970 - block
    b562 - block
    b207 - block
    b428 - block
    b319 - block
    b498 - block
    b240 - block
    b477 - block
    b278 - block
    b21 - block
    b659 - block
    b890 - block
    b321 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b706 )
    ( on b200 b706 )
    ( on b199 b200 )
    ( on b365 b199 )
    ( on b731 b365 )
    ( on b733 b731 )
    ( on b23 b733 )
    ( on b152 b23 )
    ( on b655 b152 )
    ( on b582 b655 )
    ( on b926 b582 )
    ( on b485 b926 )
    ( on b419 b485 )
    ( on b513 b419 )
    ( on b992 b513 )
    ( on b563 b992 )
    ( on b471 b563 )
    ( on b339 b471 )
    ( on b898 b339 )
    ( on b212 b898 )
    ( on b45 b212 )
    ( on b592 b45 )
    ( on b8 b592 )
    ( on b423 b8 )
    ( on b776 b423 )
    ( on b320 b776 )
    ( on b970 b320 )
    ( on b562 b970 )
    ( on b207 b562 )
    ( on b428 b207 )
    ( on b319 b428 )
    ( on b498 b319 )
    ( on b240 b498 )
    ( on b477 b240 )
    ( on b278 b477 )
    ( on b21 b278 )
    ( on b659 b21 )
    ( on b890 b659 )
    ( on b321 b890 )
    ( clear b321 )
  )
  ( :goal
    ( and
      ( clear b706 )
    )
  )
)
