( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b663 - block
    b793 - block
    b666 - block
    b250 - block
    b328 - block
    b278 - block
    b670 - block
    b440 - block
    b578 - block
    b620 - block
    b917 - block
    b989 - block
    b320 - block
    b924 - block
    b191 - block
    b378 - block
    b450 - block
    b743 - block
    b114 - block
    b253 - block
    b642 - block
    b694 - block
    b735 - block
    b35 - block
    b245 - block
    b6 - block
    b913 - block
    b510 - block
    b704 - block
    b646 - block
    b270 - block
    b725 - block
    b155 - block
    b616 - block
    b689 - block
    b127 - block
    b95 - block
    b577 - block
    b609 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b663 )
    ( on b793 b663 )
    ( on b666 b793 )
    ( on b250 b666 )
    ( on b328 b250 )
    ( on b278 b328 )
    ( on b670 b278 )
    ( on b440 b670 )
    ( on b578 b440 )
    ( on b620 b578 )
    ( on b917 b620 )
    ( on b989 b917 )
    ( on b320 b989 )
    ( on b924 b320 )
    ( on b191 b924 )
    ( on b378 b191 )
    ( on b450 b378 )
    ( on b743 b450 )
    ( on b114 b743 )
    ( on b253 b114 )
    ( on b642 b253 )
    ( on b694 b642 )
    ( on b735 b694 )
    ( on b35 b735 )
    ( on b245 b35 )
    ( on b6 b245 )
    ( on b913 b6 )
    ( on b510 b913 )
    ( on b704 b510 )
    ( on b646 b704 )
    ( on b270 b646 )
    ( on b725 b270 )
    ( on b155 b725 )
    ( on b616 b155 )
    ( on b689 b616 )
    ( on b127 b689 )
    ( on b95 b127 )
    ( on b577 b95 )
    ( on b609 b577 )
    ( clear b609 )
  )
  ( :tasks
    ( Make-38Pile b793 b666 b250 b328 b278 b670 b440 b578 b620 b917 b989 b320 b924 b191 b378 b450 b743 b114 b253 b642 b694 b735 b35 b245 b6 b913 b510 b704 b646 b270 b725 b155 b616 b689 b127 b95 b577 b609 )
  )
)
