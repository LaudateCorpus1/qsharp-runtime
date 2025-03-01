﻿// Copyright (c) Microsoft Corporation. All rights reserved.
// Licensed under the MIT License.

using System.Collections.Immutable;

namespace Microsoft.Quantum.Runtime
{
    /// <summary>
    /// Interface to provide configuration details to submit a job.
    /// </summary>
    // 
    // TODO: deprecate once the new setup is fully hooked up.
    //[Obsolete("Replaced by SubmissionOptions.")]
    public interface IQuantumMachineSubmissionContext
    {
        /// <summary>
        /// Represents the friendly name assigned to the job.
        /// </summary>
        string FriendlyName { get; set; }

        /// <summary>
        /// Represents the number of times the program will be executed.
        /// </summary>
        int Shots { get; set; }

        /// <summary>
        /// Additional target-specific parameters for the job.
        /// </summary>
        ImmutableDictionary<string, string> InputParams { get; set; }
    }
}
