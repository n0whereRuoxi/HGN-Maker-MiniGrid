( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b373 - block
    b349 - block
    b103 - block
    b425 - block
    b545 - block
    b273 - block
    b34 - block
    b139 - block
    b614 - block
    b380 - block
    b554 - block
    b320 - block
    b868 - block
    b620 - block
    b789 - block
    b290 - block
    b490 - block
    b992 - block
    b142 - block
    b21 - block
    b611 - block
    b242 - block
    b45 - block
    b459 - block
    b359 - block
    b515 - block
    b484 - block
    b451 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b373 )
    ( on b349 b373 )
    ( on b103 b349 )
    ( on b425 b103 )
    ( on b545 b425 )
    ( on b273 b545 )
    ( on b34 b273 )
    ( on b139 b34 )
    ( on b614 b139 )
    ( on b380 b614 )
    ( on b554 b380 )
    ( on b320 b554 )
    ( on b868 b320 )
    ( on b620 b868 )
    ( on b789 b620 )
    ( on b290 b789 )
    ( on b490 b290 )
    ( on b992 b490 )
    ( on b142 b992 )
    ( on b21 b142 )
    ( on b611 b21 )
    ( on b242 b611 )
    ( on b45 b242 )
    ( on b459 b45 )
    ( on b359 b459 )
    ( on b515 b359 )
    ( on b484 b515 )
    ( on b451 b484 )
    ( clear b451 )
  )
  ( :tasks
    ( Make-27Pile b349 b103 b425 b545 b273 b34 b139 b614 b380 b554 b320 b868 b620 b789 b290 b490 b992 b142 b21 b611 b242 b45 b459 b359 b515 b484 b451 )
  )
)
