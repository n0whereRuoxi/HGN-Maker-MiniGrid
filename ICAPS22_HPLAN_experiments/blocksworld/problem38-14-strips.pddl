( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b87 - block
    b642 - block
    b757 - block
    b517 - block
    b647 - block
    b914 - block
    b103 - block
    b418 - block
    b118 - block
    b66 - block
    b79 - block
    b74 - block
    b210 - block
    b680 - block
    b226 - block
    b748 - block
    b150 - block
    b35 - block
    b664 - block
    b529 - block
    b364 - block
    b983 - block
    b357 - block
    b232 - block
    b412 - block
    b243 - block
    b938 - block
    b968 - block
    b180 - block
    b574 - block
    b317 - block
    b814 - block
    b18 - block
    b807 - block
    b873 - block
    b587 - block
    b377 - block
    b882 - block
    b222 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b87 )
    ( on b642 b87 )
    ( on b757 b642 )
    ( on b517 b757 )
    ( on b647 b517 )
    ( on b914 b647 )
    ( on b103 b914 )
    ( on b418 b103 )
    ( on b118 b418 )
    ( on b66 b118 )
    ( on b79 b66 )
    ( on b74 b79 )
    ( on b210 b74 )
    ( on b680 b210 )
    ( on b226 b680 )
    ( on b748 b226 )
    ( on b150 b748 )
    ( on b35 b150 )
    ( on b664 b35 )
    ( on b529 b664 )
    ( on b364 b529 )
    ( on b983 b364 )
    ( on b357 b983 )
    ( on b232 b357 )
    ( on b412 b232 )
    ( on b243 b412 )
    ( on b938 b243 )
    ( on b968 b938 )
    ( on b180 b968 )
    ( on b574 b180 )
    ( on b317 b574 )
    ( on b814 b317 )
    ( on b18 b814 )
    ( on b807 b18 )
    ( on b873 b807 )
    ( on b587 b873 )
    ( on b377 b587 )
    ( on b882 b377 )
    ( on b222 b882 )
    ( clear b222 )
  )
  ( :goal
    ( and
      ( clear b87 )
    )
  )
)
