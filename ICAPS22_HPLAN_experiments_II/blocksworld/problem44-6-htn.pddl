( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b640 - block
    b54 - block
    b56 - block
    b570 - block
    b595 - block
    b93 - block
    b516 - block
    b383 - block
    b499 - block
    b706 - block
    b479 - block
    b285 - block
    b510 - block
    b989 - block
    b665 - block
    b911 - block
    b430 - block
    b30 - block
    b374 - block
    b547 - block
    b974 - block
    b99 - block
    b354 - block
    b211 - block
    b329 - block
    b865 - block
    b755 - block
    b983 - block
    b128 - block
    b382 - block
    b259 - block
    b338 - block
    b892 - block
    b139 - block
    b578 - block
    b820 - block
    b363 - block
    b335 - block
    b846 - block
    b144 - block
    b961 - block
    b515 - block
    b573 - block
    b878 - block
    b362 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b640 )
    ( on b54 b640 )
    ( on b56 b54 )
    ( on b570 b56 )
    ( on b595 b570 )
    ( on b93 b595 )
    ( on b516 b93 )
    ( on b383 b516 )
    ( on b499 b383 )
    ( on b706 b499 )
    ( on b479 b706 )
    ( on b285 b479 )
    ( on b510 b285 )
    ( on b989 b510 )
    ( on b665 b989 )
    ( on b911 b665 )
    ( on b430 b911 )
    ( on b30 b430 )
    ( on b374 b30 )
    ( on b547 b374 )
    ( on b974 b547 )
    ( on b99 b974 )
    ( on b354 b99 )
    ( on b211 b354 )
    ( on b329 b211 )
    ( on b865 b329 )
    ( on b755 b865 )
    ( on b983 b755 )
    ( on b128 b983 )
    ( on b382 b128 )
    ( on b259 b382 )
    ( on b338 b259 )
    ( on b892 b338 )
    ( on b139 b892 )
    ( on b578 b139 )
    ( on b820 b578 )
    ( on b363 b820 )
    ( on b335 b363 )
    ( on b846 b335 )
    ( on b144 b846 )
    ( on b961 b144 )
    ( on b515 b961 )
    ( on b573 b515 )
    ( on b878 b573 )
    ( on b362 b878 )
    ( clear b362 )
  )
  ( :tasks
    ( Make-44Pile b54 b56 b570 b595 b93 b516 b383 b499 b706 b479 b285 b510 b989 b665 b911 b430 b30 b374 b547 b974 b99 b354 b211 b329 b865 b755 b983 b128 b382 b259 b338 b892 b139 b578 b820 b363 b335 b846 b144 b961 b515 b573 b878 b362 )
  )
)
